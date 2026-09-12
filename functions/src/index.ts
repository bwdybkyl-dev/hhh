import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { initializeApp } from 'firebase-admin/app';
import { getFirestore } from 'firebase-admin/firestore';
import { getMessaging } from 'firebase-admin/messaging';
initializeApp();
export const notifyMessage = onDocumentCreated('conversations/{conversationId}/messages/{messageId}', async event => { const message=event.data?.data(); if(!message)return; const conversation=(await getFirestore().doc(`conversations/${event.params.conversationId}`).get()).data(); const recipients=(conversation?.participantIds??[]).filter((id:string)=>id!==message.senderId); await Promise.all(recipients.map(async(userId:string)=>{await getFirestore().collection('notifications').add({userId,title:'رسالة جديدة',body:message.text??'تم إرسال مرفق',createdAt:new Date(),data:{conversationId:event.params.conversationId}}); const user=(await getFirestore().doc(`users/${userId}`).get()).data(); if(user?.fcmToken)await getMessaging().send({token:user.fcmToken,notification:{title:'رسالة جديدة',body:message.text??'تم إرسال مرفق'},data:{conversationId:event.params.conversationId}});})); });
