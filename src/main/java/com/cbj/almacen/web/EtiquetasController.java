package com.cbj.almacen.web;


import com.cbj.almacen.service.CatalogoManager;
import com.cbj.almacen.service.RegEntradasManager;
import com.cbj.almacen.service.UsuarioManager;
import com.cbj.almacen.service.impl.TipoCatalogo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;


@Controller
public class EtiquetasController {
    private static final Logger logger = LoggerFactory
            .getLogger(EntradasController.class);
    @Autowired
    private CatalogoManager catalogoManager;
    @Autowired
    private UsuarioManager usuarioManager;

    @RequestMapping(value = "/generadorEtiquetas", method = RequestMethod.GET)
    public String generadorEtiquetas(Model model, Locale locale){
        logger.info("Vista para generar las etiquetas para los pallets");
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        User user = (User) SecurityContextHolder.getContext().
                getAuthentication().getPrincipal();
        List authorities = new ArrayList();

        for(GrantedAuthority autority : user.getAuthorities()){
            authorities.add(new GrantedAuthorityImpl(autority.getAuthority()));
        }

        com.cbj.almacen.domain.User usurec = this.usuarioManager.getUsuarioByUsername(user.getUsername());
        model.addAttribute("usuario", usurec.getUsername());
        model.addAttribute("now", formattedDate);
        model.addAttribute("clientes",this.catalogoManager.getCatalogo(TipoCatalogo.CLIENTE));
        return "generadorEtiquetas";
    }

    @RequestMapping(value = "/Etiquetas", method = RequestMethod.POST)
    public String Etiquetas(Model model, Locale locale,String idCliente, String rd, int tarimas, String producto,String lote,String caducidad,String peso,String alergeno, String maquila, String idalmacenista, String tif, String usuario, String qrurl){
        logger.info("Vista de la Etiqueta");
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        model.addAttribute("idCliente",idCliente);
        model.addAttribute("rd",rd);
        model.addAttribute("tarimas",tarimas);
        model.addAttribute("producto",producto);
        model.addAttribute("lote",lote);
        model.addAttribute("caducidad",caducidad);
        model.addAttribute("peso",peso);
        model.addAttribute("alergeno",alergeno);
        model.addAttribute("maquila",maquila);
        model.addAttribute("idalmacenista",idalmacenista);
        model.addAttribute("tif",tif);
        model.addAttribute("usuario",usuario);
        model.addAttribute("qrurl",qrurl);
        model.addAttribute("now", formattedDate);
        return "Etiquetas";
    }

}
