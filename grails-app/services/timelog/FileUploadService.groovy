package timelog

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class FileUploadService {
	/**
	 *
	 * @param file file to be uploaded
	 * @param name filename with file extension
	 * @param destination destination folder.
	 * @return the URL of the uploaded file
	 */
    def String upload(MultipartFile file, String name, String destination){
		//get server context to determine base path
		def context = ServletContextHolder.servletContext
		def basePath = context.getRealPath(destination)
		def baseDir = new File(basePath)
		if (!baseDir.exists())
			//the directory does not exist. so we create them
			if (baseDir.mkdirs()) println "created directory: " + baseDir
			else "failed to create directory"
		//now we can store the file
		if (!file.isEmpty()){
			def url = "${basePath}/${name}"
			file.transferTo(new File(url))
			println "FILE SAVED: ${url}"
			return url
		} else {
			println "FILE NOT SAVED"
			return null
		}
	}
}
