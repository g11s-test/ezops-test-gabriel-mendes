import mongoose, { Schema } from 'mongoose';

const MessageSchema: Schema = new Schema({
  name: String,
  message: String,
});

export default mongoose.model('Message', MessageSchema);
