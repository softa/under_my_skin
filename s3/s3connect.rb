class S3connect

	# Conecta ao bucket de INDDs
	def self.indd
		n = new
		n.bucket = "youcando-indds"
		n
	end
	def self.assets
		n = new
		n.bucket = "youcando-assets"
		n
	end
	def bucket= b
		@bucket = b
	end
    def initialize
        s3_connect
    end
	def get_file p
	#raise p.to_s
		AWS::S3::S3Object.value p, @bucket
	end
	def store_file from, to
		AWS::S3::S3Object.store to, open(from), @bucket
	end
	def store from, to, options={}
		AWS::S3::S3Object.store (to, File.open(from,'rb').read, @bucket, options)
	end
	def rename_file from, to
		AWS::S3::S3Object.rename from, to, @bucket
	end
	def copy_file  to
		AWS::S3::S3Object.copy path, to, @bucket
	end
	def exists? p
		AWS::S3::S3Object.exists? p, @bucket
	end

	def s3url p
		AWS::S3::S3Object.url_for(p, @bucket, :expires_in => 60)
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
