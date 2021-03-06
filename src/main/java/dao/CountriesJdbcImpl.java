package dao;

import exceptions.DBException;
import utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountriesJdbcImpl implements CrudDao {

    private Connection connection;
    // language=sql
    private final String SQL_SELECT_ALL = "SELECT * FROM desvelado.country";
    //language=sql
    private final String SQL_SELECT_BY_ID = "SELECT * FROM desvelado.country WHERE id = ?";
    //language=sql
    private final String SQL_SELECT_BY_COUNTRY = "SELECT * FROM desvelado.country WHERE countryname = ?";

    public CountriesJdbcImpl() {
        DatabaseConnection databaseConnection = DatabaseConnection.getInstanceToGetConnection();
        connection = databaseConnection.getConnection();
    }

    public String find(Integer id) throws DBException {
        try {
            PreparedStatement statement = connection.prepareStatement(SQL_SELECT_BY_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("countryname");
            } else return null;
        } catch (SQLException e) {
            throw new DBException();
        }
    }

    public List<String> findAll() throws DBException {
        List<String> countries = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL);
            while (resultSet.next()) {
                String country = resultSet.getString("countryname");
                countries.add(country);
            }
        } catch (SQLException e) {
            throw new DBException();
        }
        return countries;
    }

    public int findByCountry(String country) throws DBException {
        try {
            PreparedStatement statement = connection.prepareStatement(SQL_SELECT_BY_COUNTRY);
            statement.setString(1, country);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("id");
            }
        } catch (SQLException e) {
            throw new DBException();
        }
        return 0;
    }

    @Override
    public void save(Object model) {

    }

    @Override
    public void update(Object model) {

    }

    @Override
    public void delete(Integer id) {

    }

}
