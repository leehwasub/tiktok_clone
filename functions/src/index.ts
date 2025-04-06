/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

admin.initializeApp();

export const onVideoCreated = functions.firestore.onDocumentCreated("vidoes/{videoId}", async (event) => {
    const snapshot = event.data;
    const spawn = require('child-process-promise').spawn;
    const video = snapshot?.data();
    await spawn("ffmpeg", [
        "-i",
        video!.fileUrl,
        "-ss",
        "00:00:01.000",
        "-vframes",
        "1",
        "-vf",
        "scale=150:-1",
        `/tmp/${snapshot!.id}.jpg`
    ]);
    const bucket = admin.storage().bucket();
    const [file, _] = await bucket.upload(`/tmp/${snapshot!.id}.jpg`, {
        destination: `thumbnails/${snapshot!.id}.jpg`
    });
    await file.makePublic();
    await snapshot?.ref.update({thumbnailUrl: file.publicUrl()});
    const db = admin.firestore();

    await db.collection("users").doc(video!.creatorUid).collection("videos").doc(snapshot!.id).set({
        thumbnailUrl: file.publicUrl(),
        videoId: snapshot!.id
    });
});