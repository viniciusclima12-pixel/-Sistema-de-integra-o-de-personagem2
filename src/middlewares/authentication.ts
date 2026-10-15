import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export function authentication(
  request: Request,
  response: Response,
  next: NextFunction,
) {
  const authorization = request.headers.authorization;
  const [scheme, token] = authorization?.split(" ") ?? [];

  if (scheme !== "Bearer" || !token) {
    return response.status(401).json("Token de autenticação obrigatório");
  }

  try {
    jwt.verify(token, process.env.JWT_SECRET!);
    return next();
  } catch {
    return response.status(401).json("Token inválido ou expirado");
  }
}
