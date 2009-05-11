module S3connect
	@@bucket = "multimedialibrary.net"

#	def tmp_path p
#		fpath = "#{RAILS_ROOT}/files/#{p}"
#		if ! File.exists?(fpath) or File.zero?(fpath)
#			s3_connect
#			d = p.split(/\//)
#			d.pop
#			path = d.join('/')
#			FileUtils.mkdir_p "#{RAILS_ROOT}/files/#{path}"
#			f = File.new(fpath, "w")
#			f.write( get_file(p) )
#			f.close
#		end
##	end

    def initialize
        s3_connect
    end
	def get_file p
		AWS::S3::S3Object.value p, @@bucket
	end
	def store_file from, to
		AWS::S3::S3Object.store to, open(from), @@bucket
	end
	def rename_file from, to
		AWS::S3::S3Object.rename from, to, @@bucket
	end
	def copy_file  to
		AWS::S3::S3Object.copy path, to, @@bucket
	end

	def s3url p
		AWS::S3::S3Object.url_for(p, @@bucket, :expires_in => 60)
	end
	
	protected
		def s3_connect
			require 'aws/s3'
			AWS::S3::Base.establish_connection!(
				:access_key_id     => '17CCTME27N8EDE065S82',
				:secret_access_key => 'C0acIz+8V+IF8FJj5MQe3WYrphYZsjJvuCX4cb84'
			)
			@s3connected = true
		end

end
