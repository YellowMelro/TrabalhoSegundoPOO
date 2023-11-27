// arquivo: services/leilaoService.ts
import * as leilaoController from '../controllers/leilaoController';

export const criarNovoLeilao = async (produto: string, preco: number, datalimite: Date, donoId: number) => {
  return await leilaoController.criarLeilao(produto, preco, datalimite, donoId);
};

export const listarLeiloes = async () => {
  return await leilaoController.listarLeiloes();
};

export const atualizarLeilao = async (id: number, produto: string, preco: number, datalimite: Date) => {
  return await leilaoController.atualizarLeilao(id, produto, preco, datalimite);
};

export const deletarLeilao = async (id: number) => {
  return await leilaoController.deletarLeilao(id);
};