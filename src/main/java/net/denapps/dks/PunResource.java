package net.denapps.dks;

import net.denapps.dks.entities.Pun;

import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.net.URI;
import java.util.List;
import java.util.UUID;

@Path("/puns")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PunResource {
    @GET
    @Path("/")
    public List<Pun> getPuns() {
        return Pun.listAll();
    }

    @GET
    @Path("/{id}")
    public Pun get(@PathParam("id") Long id) {
        return Pun.findById(id);
    }

    @POST
    @Transactional
    public Response create(Pun pun) {
        pun.persist();
        return Response.created(URI.create("/puns/" + pun.id)).build();
    }

    @PUT
    @Path("/{id}")
    @Transactional
    public Pun update(@PathParam("id") Long id, Pun pun) {
        Pun entity = Pun.findById(id);
        if(entity == null) {
            throw new NotFoundException();
        }

        // map all fields from the pun parameter to the existing entity
        entity.punTitle = pun.punTitle;

        return entity;
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    public void delete(@PathParam("id") Long id) {
        Pun entity = Pun.findById(id);
        if(entity == null) {
            throw new NotFoundException();
        }
        entity.delete();
    }



    @GET
    @Path("/count")
    public Long count() {
        return Pun.count();
    }

}
