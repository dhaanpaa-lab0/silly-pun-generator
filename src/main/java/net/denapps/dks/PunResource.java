package net.denapps.dks;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.UUID;

@Path("/puns")
public class PunResource {
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getPun() { return UUID.randomUUID().toString().replaceAll("-","");
    }
}
