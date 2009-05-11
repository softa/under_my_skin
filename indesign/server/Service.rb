require 'xsd/qname'

# {http://ns.adobe.com/InDesign/soap/}IDSP-ScriptArg
#   name - SOAP::SOAPString
#   value - SOAP::SOAPString
class IDSPScriptArg
  attr_accessor :name
  attr_accessor :value

  def initialize(name = nil, value = nil)
    @name = name
    @value = value
  end
end

# {http://ns.adobe.com/InDesign/soap/}RunScriptParameters
#   scriptText - SOAP::SOAPString
#   scriptLanguage - SOAP::SOAPString
#   scriptFile - SOAP::SOAPString
#   scriptArgs - IDSPScriptArg
class RunScriptParameters
  attr_accessor :scriptText
  attr_accessor :scriptLanguage
  attr_accessor :scriptFile
  attr_accessor :scriptArgs

  def initialize(scriptText = nil, scriptLanguage = nil, scriptFile = nil, scriptArgs = [])
    @scriptText = scriptText
    @scriptLanguage = scriptLanguage
    @scriptFile = scriptFile
    @scriptArgs = scriptArgs
  end
end

# {http://ns.adobe.com/InDesign/soap/}Data
#   data - (any)
class C_Data
  attr_accessor :data

  def initialize(data = nil)
    @data = data
  end
end

# {http://ns.adobe.com/InDesign/soap/}List
class List < ::Array
end

# {http://ns.adobe.com/InDesign/soap/}Object
#   specifierData - (any)
#   objectType - SOAP::SOAPUnsignedLong
#   specifierForm - SOAP::SOAPUnsignedLong
#   start - C_Object
#   m_end - C_Object
class C_Object
  attr_accessor :specifierData
  attr_accessor :objectType
  attr_accessor :specifierForm
  attr_accessor :start

  def m_end
    @v_end
  end

  def m_end=(value)
    @v_end = value
  end

  def initialize(specifierData = nil, objectType = nil, specifierForm = nil, start = nil, v_end = nil)
    @specifierData = specifierData
    @objectType = objectType
    @specifierForm = specifierForm
    @start = start
    @v_end = v_end
  end
end

# {http://ns.adobe.com/InDesign/soap/}ObjectList
class ObjectList < ::Array
end

# {http://ns.adobe.com/InDesign/soap/}Field
#   id - SOAP::SOAPUnsignedLong
#   data - C_Data
class Field
  attr_accessor :id
  attr_accessor :data

  def initialize(id = nil, data = nil)
    @id = id
    @data = data
  end
end

# {http://ns.adobe.com/InDesign/soap/}Record
class Record < ::Array
end

# {http://ns.adobe.com/InDesign/soap/}RunScript
#   runScriptParameters - RunScriptParameters
class RunScript
  attr_accessor :runScriptParameters

  def initialize(runScriptParameters = nil)
    @runScriptParameters = runScriptParameters
  end
end

# {http://ns.adobe.com/InDesign/soap/}RunScriptResponse
#   errorNumber - SOAP::SOAPInt
#   errorString - SOAP::SOAPString
#   scriptResult - C_Data
class RunScriptResponse
  attr_accessor :errorNumber
  attr_accessor :errorString
  attr_accessor :scriptResult

  def initialize(errorNumber = nil, errorString = nil, scriptResult = nil)
    @errorNumber = errorNumber
    @errorString = errorString
    @scriptResult = scriptResult
  end
end
