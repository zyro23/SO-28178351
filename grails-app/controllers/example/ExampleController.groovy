package example

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class ExampleController {

	def index() {}
	
		@MessageMapping("/hello")
		@SendTo("/topic/hello")
		protected String hello(String world) {
			return "hello from controller, ${world}!"
		}
		
		@MessageMapping("/project")
		@SendTo("/topic/project")
		protected String project(String world) {
			return "Project from controller, ${world}!"
		}
	
}
