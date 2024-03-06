const express = require('express');
const sqlite3 = require('sqlite3');

const app = express();
const port = 3000;
console.log('Conectado ao banco de dados floricultura.');

app.get('/dados_compras_com_entrega', (req, res) => {
    const db = new sqlite3.Database('floricultura.db', (err) => {
        if (err) {
            console.error(err.message);
            res.status(500).json({ error: 'Erro ao conectar ao banco de dados.' });
            return;
        }

        const query = "SELECT * FROM ComprasComEntregaView;";
        db.all(query, [], (err, rows) => {
          
            const dados_json = Array.isArray(rows) ? rows.map(dado => ({
                id_compra: dado.id_compra,
                data_pedido: dado.data_pedido,
                nome_flor: dado.nome_flor,
                id_cliente: dado.id_cliente,
                nome_cliente: dado.nome_cliente,
                id_entrega: dado.id_entrega,
                data_entrega: dado.data_entrega,
                endereco_entrega: dado.endereco_entrega,
                possui_entrega: dado.possui_entrega,
                sem_entrega: dado.sem_entrega
            })) : [];

            res.json({ compras_com_entrega: dados_json });

           
            db.close((err) => {
                if (err) {
                    console.error(err.message);
                }
                console.log('Conexão com o banco de dados fechada.');
            });
        });
    });
});

app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});