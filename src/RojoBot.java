import org.telegram.telegrambots.api.methods.send.SendMessage;
import org.telegram.telegrambots.api.objects.Update;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.exceptions.TelegramApiException;
import java.sql.*;
import java.util.regex.*;

/*Autor:Rodrigo Rojo Ugalde, Richard Garcia
 *Fecha de ultima modificación: 03/07/2018
 *Proposito de la clase: Realizar la conexion con la aplicacion telegram
 * asi como el funcionamiento de el bot respondiendo a preguntas
 * */

public class RojoBot extends TelegramLongPollingBot {
    Connection conexion =null;
    Connection inserta=obtenConexion();
     boolean comprobante=true;
    String sql="",
            texto="";

    @Override
    public void onUpdateReceived(Update update) {
      texto=update.getMessage().getText();
      buscaPalabra(texto);

      System.out.print(update.getMessage().getFrom().getFirstName()
                       + " " + update.getMessage().getText()+"\n");
        //se manda el mensaje
      SendMessage mandaMensaje = new SendMessage().setChatId(update.getMessage()
                                                                  .getChatId());
      if (comprobante==buscaPalabra(update.getMessage().getText())) {
        mandaMensaje.setText("HOLA " + update.getMessage().getFrom().getFirstName()
                                     +", lo atiende Rodrigo Rojo, ¿en que lo ayudamos?");
      }
      else {
          if (update.getMessage().getText().equals("quien soy?") || update.getMessage()
                                                     .getText().equals("Quien soy?")) {
              mandaMensaje.setText("eres " + update.getMessage().getFrom().getFirstName());

          }
          else {
              mandaMensaje.setText("no logre entenderte amigo ");

              sql="insert into pruebadeincercion(texto)VALUES (?)";
              try {
                  PreparedStatement pst= inserta.prepareStatement(sql);
                  pst.setString(1,texto);
                  pst.executeUpdate();
              }
              catch (SQLException e) {
                  e.printStackTrace();
              }
          }
      }
      try {
          sendMessage(mandaMensaje);
      }
      catch (TelegramApiException e) {
          e.printStackTrace();
      }
      }

    public String getBotUsername() {

        return null;
    }
    //este metodo se encarga de devolver el token de la aplicación
    //para la conexion con el bot, no necesita parametros adicionales
    public String getBotToken() {

        return "575663470:AAEFOVo1a7ld4YTgjP65fZY3r5qqvwct2eg";
    }
    /*este metodo se encarga establecer la conexion con la base de conocimiento
    para la conexion con el bot, no necesita parametros adicionales
    retorna el estado de la conexion, el manejo de excepciones es para
    posibles fallas con el SGBD
    */
    public Connection obtenConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion=DriverManager.getConnection("jdbc:mysql://localhost/cinetop",
                                                             "root","");
            System.out.print("conexión establecida");
        }
        catch (ClassNotFoundException | SQLException e)
        {
            System.out.print("error de conexion");
        }
        return conexion;
    }

    public Boolean buscaPalabra(String b){
        String aguja = "hola";//palabra buscada
        String pajar = b;    //texto
        Boolean numero=false;
         //escapar y agregar limites de palabra completa - case-insensitive
        Pattern regex = Pattern.compile("\\b" + Pattern.quote(aguja) + "\\b", Pattern.CASE_INSENSITIVE);
        Matcher match = regex.matcher(pajar);

        //la palabra está en el texto??
        if (match.find()) {  //si se quiere encontrar todas las ocurrencias: cambiar el if por while
            System.out.println("Encontrado: '" + match.group()
                    + "' dentro de '" + pajar
                    + "' en la posición " + match.start());
            numero =true;
        } else {
            System.out.println("'" + aguja + "' NO está dentro de '" + pajar);
            numero=false;
        }
        return numero;
    }
}
