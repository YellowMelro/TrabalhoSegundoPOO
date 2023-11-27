// arquivo: src\controllers\leilaoController.ts

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const criarLeilao = async (produto: string, preco: number, datalimite: Date, donoId: number) => {
  try {
    const leilao = await prisma.leilao.create({
      data: { produto, preco, datalimite, donoId },
    });
    return leilao;
  } catch (error: any) {
    throw new Error(`Erro ao criar leilão: ${error.message}`);
  }
};

export const listarLeiloes = async () => {
  console.log('emtrou em LISTARLEILOES')
  try {
    const leiloes = await prisma.leilao.findMany();
    return leiloes;
  } catch (error: any) {
    throw new Error(`Erro ao listar leilões: ${error.message}`);
  }
};

export const atualizarLeilao = async (id: number, produto: string, preco: number, datalimite: Date) => {
  try {
    const leilaoAtualizado = await prisma.leilao.update({
      where: { id },
      data: { produto, preco, datalimite },
    });
    return leilaoAtualizado;
  } catch (error: any) {
    throw new Error(`Erro ao atualizar leilão: ${error.message}`);
  }
};

export const deletarLeilao = async (id: number) => {
  try {
    const leilaoDeletado = await prisma.leilao.delete({
      where: { id },
    });
    return leilaoDeletado;
  } catch (error: any) {
    throw new Error(`Erro ao deletar leilão: ${error.message}`);
  }
};
