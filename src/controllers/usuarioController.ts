// arquivo: controllers/usuarioController.ts

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const criarUsuario = async (nome: string, email: string) => {
  try {
    const usuario = await prisma.usuario.create({
      data: { nome, email },
    });
    return usuario;
  } catch (error: any) {
    throw new Error(`Erro ao criar usuário: ${error.message}`);
  }
};

export const listarUsuarios = async () => {
  return await prisma.usuario.findMany();
};

export const atualizarUsuario = async (id: number, nome: string, email: string) => {
  try {
    const usuarioAtualizado = await prisma.usuario.update({
      where: { id },
      data: { nome, email },
    });
    return usuarioAtualizado;
  } catch (error: any) {
    throw new Error(`Erro ao atualizar usuário: ${error.message}`);
  }
};

export const deletarUsuario = async (id: number) => {
  try {
    const usuarioDeletado = await prisma.usuario.delete({
      where: { id },
    });
    return usuarioDeletado;
  } catch (error: any) {
    throw new Error(`Erro ao deletar usuário: ${error.message}`);
  }
};
