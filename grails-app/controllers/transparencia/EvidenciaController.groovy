package transparencia

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

import grails.converters.JSON
import javax.servlet.MultipartConfigElement
import javax.servlet.*
import java.io.*
import javax.servlet.http.*


@Secured(['ROLE_ADMIN','ROLE_ENTIDAD'])
@Transactional(readOnly = false)
class EvidenciaController {

    EvidenciaService evidenciaService

    def concepto=null;
    def index(Integer max, Integer id) {
        if(params.presupuestoId) {
            session.presupuestoId = params.presupuestoId
        }
        println(id)
        def mapa = [:]
        concepto= Concepto.findById(id)
        if(!concepto.isHoja()){
            redirect action:'index', controller:'concepto', params:[id:session.presupuestoId]
            return
        }
        println(concepto.descripcion)
        def evidencias=Evidencia.findAllByConcepto(concepto)
        params.max = Math.min(max ?: 10, 100)
        //respond evidenciaService.list(params), model:[evidenciaCount: evidenciaService.count()]
        mapa.put("evidencias",evidencias)
        mapa.put("evidenciaCount",evidenciaService.count())
        mapa.put("concepto",concepto)
        respond evidenciaService.list(params), model:mapa
    }

    def show(Long id) {
        respond evidenciaService.get(id)
    }

    def create(Integer id) {
        println("ConceptoId:"+id)
        def concepto=Concepto.findById(id)
        def mapa = [:]
        mapa.put("concepto",concepto)

        respond new Evidencia(params), model:mapa
    }

    def save(Evidencia evidencia) {
        println(params)
        println("IdConceptoSave:"+params.idConcepto)
        def concepto=Concepto.findById(params.idConcepto)
        println "El concepto es:"+concepto.descripcion
        evidencia.concepto=concepto
        if (evidencia == null) {

            notFound()
            return
        }
        def archivos = request.getParts()
        //def archivos = request.getPart("nombre")
        for(item in archivos) {
            println "--"
            //println item.size()
            //println item.getSubmittedFileName()
            String fileName = getFileName(item);
            if(fileName!="" && fileName=="archivo"){
                println fileName
                String ubicacion = request.getServletContext().getRealPath("/")+"archivosUsuarios"
                println ubicacion
                def storagePathDirectory = new File(ubicacion)

                if (!storagePathDirectory.exists()) {
                    storagePathDirectory.mkdirs()
                }
                InputStream is = item.getInputStream();
                String ruta = request.getServletContext().getRealPath("/") + "archivosUsuarios" + "/" + item.getSubmittedFileName();

                FileOutputStream fos = new FileOutputStream(new File(ruta));
                int dato = is.read();
                while (dato != -1) {
                    fos.write(dato);
                    dato = is.read();
                }
                fos.close();
                is.close();
                File file = new File(ruta)
                Double peso=file.length()/1024
                evidencia.src=ruta
            }
        }
        try {
            evidencia.save(failOnError: true, flush:true)
        } catch (ValidationException e) {
            println(evidencia.errors)
            respond evidencia.errors, view:'create'
            return
        }
        //concepto.addToEvidencias(evidencia)
        //concepto.save(flush:true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Evidencia Registrada!"
        flash.message = "La evidencia a sido registrada correctamente"

        redirect(action: "index", params:[id: concepto.id])
    }
    public static String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp );
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("name")) {
                return token.substring(token.indexOf("=") + 2,
                    token.length() - 1 );
            }
        }
        return ""
    }

    def edit(Long id) {
        respond evidenciaService.get(id)
    }

    def update(Evidencia evidencia) {
        if (evidencia == null) {
            notFound()
            return
        }

        try {
            evidenciaService.save(evidencia)
        } catch (ValidationException e) {
            respond evidencia.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'evidencia.label', default: 'Evidencia'), evidencia.id])
                redirect evidencia
            }
            '*'{ respond evidencia, [status: OK] }
        }
    }

    def delete(Evidencia evidencia) {
        println params

        if (evidencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }


        evidencia.delete flush:true
        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Evidencia borrado"
        flash.message = "Se ha borrado la evidencia correctamente"
        redirect(controller:"evidencia", action: "index", params:["id":concepto.id])
    }

    def descargarArchivo(String ubicacion) {
        def file = new File(ubicacion);

        if (file.exists()) {
           response.setContentType("application/octet-stream")
           response.setHeader("Content-disposition", "filename=${file.name}")
           response.outputStream << file.bytes
           return
       }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'evidencia.label', default: 'Evidencia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
