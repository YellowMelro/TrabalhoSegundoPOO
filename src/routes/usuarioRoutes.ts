// arquivo: routes/usuarioRoutes.ts

import { Router, Request, Response } from 'express';
import * as usuarioService from '../services/usuarioService';

const router = Router();

router.post('/usuario', async (req: Request, res: Response) => {
  const { nome, email } = req.body;

  try {
    const novoUsuario = await usuarioService.criarNovoUsuario(nome, email);
    res.status(201).json(novoUsuario);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
});

router.put('/usuario', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { nome, email } = req.body;

  try {
    const usuarioAtualizado = await usuarioService.atualizarUsuario(Number(id), nome, email);
    res.status(200).json(usuarioAtualizado);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
});

router.delete('/usuario', async (req: Request, res: Response) => {
  const { id } = req.params;

  try {
    const usuarioDeletado = await usuarioService.deletarUsuario(Number(id));
    res.status(200).json(usuarioDeletado);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
});

router.get('/usuarios', async (_req: Request, res: Response) => {
  try {
    const usuarios = await usuarioService.listarUsuarios();
    res.status(200).json(usuarios);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
});

export default router;
