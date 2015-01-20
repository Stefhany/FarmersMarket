/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

import dtos.OfertasDTO;
import java.util.LinkedList;

/**
 *
 * @author krito
 */
public class prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
//        ProductoDTO udto = new ProductoDTO();
//        ProductoDAO pdao = new ProductoDAO();
//        System.out.println(pdao.consultarByIdProduct(3));
        
        OfertasDAO odao = new OfertasDAO();
        LinkedList<OfertasDTO> offer = new LinkedList();
        offer = (LinkedList<OfertasDTO>) odao.consultarOfertas();
        for (OfertasDTO of : offer){
            System.out.println("Oferta: "+of.getProducts().getCategoriaId().getNombre()+" tiene el productor "+of.getUser().getNombres()+" "+
                    " con el producto: "+of.getProducts().getNombre()+ ", con la cantidad "+of.getCantidad()+" y el precio: "+of.getPrecio());
        }
    }
    
}
