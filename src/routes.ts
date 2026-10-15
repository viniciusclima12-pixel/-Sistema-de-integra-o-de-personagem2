import { Router } from "express";
import personagemController from "./controllers/personagem";
import usuarioController from "./controllers/usuario";
import { authentication } from "./middlewares/authentication";

// Inicializa o router
const routes = Router();

// Rotas de personagens
routes.get("/personagens", personagemController.list);
routes.get("/personagens/:id", personagemController.getById);
routes.post("/personagens", authentication, personagemController.create);
routes.put("/personagens/:id", authentication, personagemController.update);
routes.delete("/personagens/:id", authentication, personagemController.delete);

// Rotas de usuários
routes.post("/login", usuarioController.login);
routes.post("/usuarios", usuarioController.create);

export default routes;