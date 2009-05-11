require 'rubygems'
gem 'soap4r'
require 'ServiceDriver.rb'
require 'Service.rb'

obj = ServicePortType.new
obj.wiredump_dev = STDERR if $DEBUG

s = <<-SCRIPT
var myDocument = app.documents.add();
var myPage = myDocument.pages.item(0);
var myTextFrame = myPage.textFrames.add();
myTextFrame.geometricBounds = ["6p0", "6p0", "18p0", "18p0"];
myTextFrame.contents = "Hello World!";
myDocument.save(new File("/c/HelloWorld.indd"));
app.documents.item(0).close();
SCRIPT
s = File.read('/home/maiz/public_html/ycd/jsx/export_to_jpg.jsx')
#parameters = RunScriptParameters.new(s, 'javascript', 'C:/HelloWorl.jsx', [100,'sjkdg'])
#puts parameters.inspect
#begin
#puts
#, 'C:/HelloWorl.jsx', [100,'sjkdg']
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
    #ret = 
    obj.runScript(rsp)
#    puts ret.scriptResult.inspect #.objectType.inspect
}
#    puts (ret.methods - Class.methods).inspect
    # , '', [100,'sjkdg']) 
#rescue => e

#    puts e
#end


#None: The required SOAP element "RunScriptParameters" could not be found. Please check the SOAP message that was sent to InDesignServer. (SOAP::FaultError)


