import mongoose from 'mongoose';

mongoose.connect(
  `${process.env.MONGO_URI}`,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  },
  (err) => {
    if (err) {
      console.log('error mongodb', err);
    } else {
      console.log('mongodb connected');
    }
  }
);
