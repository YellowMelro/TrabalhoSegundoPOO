// arquivo: services/lanceService.ts

import * as lanceController from '../controllers/lanceController';

export const criarNovoLance = async (valor: number, compradorId: number, leilaoId: number) => {
  return await lanceController.criarLance(valor, compradorId, leilaoId);
};

export const listarLances = async () => {
  return await lanceController.listarLances();
};

export const atualizarLance = async (id: number, valor: number) => {
  return await lanceController.atualizarLance(id, valor);
};

export const deletarLance = async (id: number) => {
  return await lanceController.deletarLance(id);
};
