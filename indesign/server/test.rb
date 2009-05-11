require 'rubygems'
gem 'soap4r'
require 'ServiceDriver.rb'
require 'Service.rb'

obj = ServicePortType.new
obj.wiredump_dev = STDERR if $DEBUG

s = %{
arg0 = '/c/ServerTestFiles/in/templates/68/original_love.indd'\n
arg1 = '/c/ServerTestFiles/out/love.jpg'\n
} + File.read('/home/maiz/public_html/ycd/jsx/export_to_jpg.jsx')

rsp = RunScript.new(RunScriptParameters.new(s, 'javascript'))
#puts (rsp.methods - Class.methods).inspect
#begin
#
 #   obj.methods - Class.methods).inspect
#    wiredump_dev
#    streamhandler
#    obj.runScript( RunScriptParameters.new(s, 'javasript') )

require 'benchmark'
puts Benchmark.measure {
    ret = obj.runScript(rsp)
    puts ret.scriptResult.data.inspect #.objectType.inspect
}
#    puts (ret.methods - Class.methods).inspect
    # , '', [100,'sjkdg']) 
#rescue => e

#    puts e
#end


#None: The required SOAP element "RunScriptParameters" could not be found. Please check the SOAP message that was sent to InDesignServer. (SOAP::FaultError)


