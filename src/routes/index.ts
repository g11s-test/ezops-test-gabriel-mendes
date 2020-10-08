import { Router } from 'express';
import MessagesRouter from './messages';

const router = Router();

router.use('/messages', MessagesRouter);

export default router;
