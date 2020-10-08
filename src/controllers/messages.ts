import Message from '../models/message';

interface IMessage {
  name: string;
  message: string;
}

export const index = async () => {
  return await Message.find({});
};

export const save = async (params: IMessage) => {
  const message = new Message(params).save();

  return message;
};
