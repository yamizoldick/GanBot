
import org.telegram.telegrambots.api.methods.send.SendMessage;
import org.telegram.telegrambots.api.methods.send.SendPhoto;
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
    Update g_update;
     boolean comprobante=true;
    String sql="",texto="";

    @Override
    public void onUpdateReceived(Update update) {
        g_update=update;
        String sql="",
                texto="";
        System.out.print(update.getMessage().getFrom().getFirstName()
                + " " + update.getMessage().getText()+"\n");
        //se manda el mensaje
        texto=update.getMessage().getText();
        SendMessage mandaMensaje = new SendMessage()
                                        .setChatId(update.getMessage()
                                        .getChatId());

        int [] matrizPalabras =buscaPalabra1(update.getMessage().getText());
        if (matrizPalabras[0]==1) {
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
            //Prueba del metodo, ELIMINAR EN VERSION FINAL
            ResultSet rs;
            String url="";
            try {
                //Prueba del metodo, ELIMINAR EN VERSION FINAL
                Statement query= inserta.createStatement();
                 rs= query.executeQuery ("select imag_peli from pelicula where id_peli=5");
                while (rs.next())
                {
                    //Prueba del metodo, ELIMINAR EN VERSION FINAL
                    System.out.println (rs.getString (1));
                    url=rs.getString(1);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            sendMessage(mandaMensaje);

            //Prueba del metodo, ELIMINAR EN VERSION FINAL
            //enviarImagen("https://www.cinetop.com/CDN/media/entity/get/FilmPosterGraphic/h-HO00000222?referenceScheme=Cinema&allowPlaceHolder=true&height=600","Prueba");
            enviarImagen(url,"MCO");
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
    
    public int[] buscaPalabra1 (String b){
        String [] arregloDePalabras = {"hola","Cuál","cuales","pelicula","peliculas","Funcion"
                                                                 ,"funciones","combo","combos"};//palabra buscada
        String pajar = b,
                  aguja="";    //texto
        int [] numero=new int[9];
        //escapar y agregar limites de palabra completa - case-insensitive
        for (int X=0;X<=8;X++) {
            aguja=arregloDePalabras[X];
            Pattern regex = Pattern.compile("\\b" + Pattern.quote(aguja) + "\\b", Pattern.CASE_INSENSITIVE);
            Matcher match = regex.matcher(pajar);
            //la palabra está en el texto??
            if (match.find()) {  //si se quiere encontrar todas las ocurrencias: cambiar el if por while
                System.out.println("Encontrado: '" + match.group()
                        + "' dentro de '" + pajar
                        + "' en la posición " + match.start());
                numero[X] = 1;
            } else {
                System.out.println("'" + aguja + "' NO está dentro de '" + pajar);
                numero[X] = 0;
            }


        }
        System.out.println(numero[0]+" "+numero[1]);
        return numero;
    }


    //Metodo encargado de enviar una determinada imagen a telegram
    public void enviarImagen(String url, String nombre) {
        //Instancia a la Clase SendPhoto y especificacion de propiedades
        SendPhoto sendPhotoRequest = new SendPhoto()
                                        .setChatId(g_update.getMessage().getChatId())
                                        .setCaption(nombre)
                                        .setPhoto(url);
        try {
            sendPhoto(sendPhotoRequest);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }
}
