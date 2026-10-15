import { Request, Response } from "express";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { prisma } from "../../config/prisma";
import { handleErrors } from "../helpers/handleErrors";

export default {
  login: async (request: Request, response: Response) => {
    try {
      const { email, senha } = request.body;

      if (!email || !senha) {
        return response.status(400).json("Dados incompletos");
      }

      const usuario = await prisma.usuario.findFirst({
        where: { email },
      });

      if (!usuario || !bcrypt.compareSync(senha, usuario.senha)) {
        return response.status(401).json("Email e/ou senha inválidos");
      }

      const token = jwt.sign({ id: usuario.id }, process.env.JWT_SECRET!, {
        expiresIn: "1d",
      });

      return response.status(200).json(token);
    } catch (e) {
      return handleErrors(e, response);
    }
  },

  create: async (request: Request, response: Response) => {
    try {
      const { nome, email, senha } = request.body;

      if (!nome || !email || !senha) {
        return response.status(400).json("Dados do usuário incompletos");
      }

      const usuario = await prisma.usuario.create({
        data: {
          nome,
          email,
          senha: bcrypt.hashSync(senha, +process.env.BCRYPT_ROUNDS!),
        },
       
      });

      return response.status(201).json(usuario);
    } catch (e) {
      return handleErrors(e, response);
    }
  },
};
