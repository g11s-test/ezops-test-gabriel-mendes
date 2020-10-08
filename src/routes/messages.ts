import { Router } from "express";
import { index, save } from "../controllers/messages";
const messagesRouter = Router();

messagesRouter.get("/", (req, res) => {
  index().then((messages) => {
    res.send(messages);
  });
});

messagesRouter.post("/", (req, res) => {
  const { body, io } = req;

  save(body).then((data) => {
    if (data) {
      io.emit("message", body);
    } else {
      res.send("Erro ao salvar mensagem").sendStatus(500);
    }
  });
});

export default messagesRouter;
