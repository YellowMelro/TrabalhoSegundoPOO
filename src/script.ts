import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  try {
    // Crie um usuário
    const user = await prisma.usuario.create({
      data: {
        nome: 'Alie',
        email: 'alie@prisma.io',
      },
    });
    console.log('Usuário criado:', user);

    // Crie um leilão
    const leilao = await prisma.leilao.create({
      data: {
        produto: 'Produto do Leilão',
        preco: 100.0,
        datalimite: new Date(),
        dono: {
          connect: { id: user.id }, // Associe o dono do leilão ao usuário recém-criado
        },
      },
    });
    console.log('Leilão criado:', leilao);

    // Crie um lance
    const lance = await prisma.lance.create({
      data: {
        valor: 50.0,
        comprador: {
          connect: { id: user.id }, // Associe o comprador ao usuário recém-criado
        },
        leilao: {
          connect: { id: leilao.id }, // Associe o leilão ao leilão recém-criado
        },
      },
    });
    console.log('Lance criado:', lance);
  } catch (error) {
    console.error('Erro ao criar usuário, leilão e lance:', error);
  } finally {
    // Desconecte o Prisma
    await prisma.$disconnect();
  }
}

main();
