module Indesign
    class Server
        def self.up?
            require 'open-uri'
            begin
                open("http://localhost:3000/site/monte")
                return "1"
            rescue => e
                return "0"
            end
        end
        def self.start
            `InDesignServer.com -port 12345`
        end
        def self.stop
        end
        def self.win_path
            "/c/ServerTestFiles/"
        end    
        
        def self.run script_path, params
            gem 'soap4r'
            require "indesign/server/ServiceDriver"
            obj = ServicePortType.new("http://localhost:12345/service?wsdl")
            obj.wiredump_dev = STDERR if $DEBUG
            s = ""
            i = 0
            for param in params
                s += %{ arg#{i} = '#{param}'\n }
                i += 1
            end
            s += File.read(script_path)
#            raise s
            rsp = RunScript.new(RunScriptParameters.new(s, 'javascript'))
            return obj.runScript(rsp)
        rescue Errno::ECONNREFUSED => e
            #TODO some log please!
#            Rails.logger.warn e
            return false
        end
        ##
        # arg0, arg1, arg2
        # arg0 - path to INDD
        # arg1 - path to JPGs
        # arg2 - path to XML
        ##
        def self.process_indd *args
            run('jsx/process_indd.jsx', args)
        end
    end
end
