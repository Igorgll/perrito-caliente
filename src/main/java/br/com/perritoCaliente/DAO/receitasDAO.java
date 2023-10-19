package br.com.perritoCaliente.DAO;

import br.com.perritoCaliente.model.Receita;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static br.com.perritoCaliente.DAO.sqlQueries.Queries.*;

public class receitasDAO {

    public void criarReceita(Receita receita) {

        //String SQL = "";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("Conexão bem sucedida");

            PreparedStatement preparedStatement = connection.prepareStatement(CRIA_RECEITA);

            preparedStatement.setString(1, receita.getNomeReceita());
            preparedStatement.execute();

            System.out.println("Receita adicionada com sucesso!");

            connection.close();

        } catch (Exception e) {
            System.out.println("Falha ao adicionar a receita");
        }

    }

    public List<Receita> findAllCars() {


        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SELECIONAR_RECEITA);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Receita> receitas = new ArrayList<>();

            while (resultSet.next()) {

                String nomeReceita = resultSet.getString("Titulo");

                Receita receita = new Receita(nomeReceita);

                receitas.add(receita);

            }

            System.out.println("success in select * receitas");

            connection.close();

            return receitas;

        } catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }

    }

}