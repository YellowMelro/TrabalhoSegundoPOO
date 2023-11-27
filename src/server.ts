// arquivo: src\app.ts
import express from 'express';
import usuarioRoutes from './routes/usuarioRoutes';
import leilaoRoutes from './routes/leilaoRoutes';
import lanceRoutes from './routes/lanceRoutes';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Adicione prefixos para suas rotas
app.use(usuarioRoutes);
app.use(leilaoRoutes);
app.use(lanceRoutes);

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
