// src\controllers\lanceController.ts

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const criarLance = async (valor: number, compradorId: number, leilaoId: number) => {
  try {
    const lance = await prisma.lance.create({
      data: { valor, compradorId, leilaoId },
    });
    return lance;
  } catch (error: any) {
    throw new Error(`Erro ao criar lance: ${error.message}`);
  }
};

export const listarLances = async () => {
  try {
    const lances = await prisma.lance.findMany();
    return lances;
  } catch (error: any) {
    throw new Error(`Erro ao listar lances: ${error.message}`);
  }
};

export const atualizarLance = async (id: number, valor: number) => {
  try {
    const lanceAtualizado = await prisma.lance.update({
      where: { id },
      data: { valor },
    });
    return lanceAtualizado;
  } catch (error: any) {
    throw new Error(`Erro ao atualizar lance: ${error.message}`);
  }
};

export const deletarLance = async (id: number) => {
  try {
    const lanceDeletado = await prisma.lance.delete({
      where: { id },
    });
    return lanceDeletado;
  } catch (error: any) {
    throw new Error(`Erro ao deletar lance: ${error.message}`);
  }
};
