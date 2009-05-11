#require 'Service.rb'
require 'soap/mapping'
#require 'soap/mapping/encodedregistry'

module ServiceMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsSoap = "http://ns.adobe.com/InDesign/soap/"

  EncodedRegistry.register(
    :class => IDSPScriptArg,
    :schema_type => XSD::QName.new(NsSoap, "IDSP-ScriptArg"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  EncodedRegistry.register(
    :class => RunScriptParameters,
    :schema_type => XSD::QName.new(NsSoap, "RunScriptParameters"),
    :schema_element => [
      ["scriptText", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptText")], [0, 1]],
      ["scriptLanguage", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptLanguage")], [0, 1]],
      ["scriptFile", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptFile")], [0, 1]],
      ["scriptArgs", ["IDSPScriptArg[]", XSD::QName.new(nil, "scriptArgs")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => C_Data,
    :schema_type => XSD::QName.new(NsSoap, "Data"),
    :schema_element => [
      ["data", [nil, XSD::QName.new(nil, "data")]]
    ]
  )

  EncodedRegistry.register(
    :class => List,
    :schema_type => XSD::QName.new(NsSoap, "List"),
    :schema_element => [
      ["item", ["C_Data[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => C_Object,
    :schema_type => XSD::QName.new(NsSoap, "Object"),
    :schema_element => [
      ["specifierData", [nil, XSD::QName.new(nil, "specifierData")]],
      ["objectType", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "objectType")]],
      ["specifierForm", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "specifierForm")]],
      ["start", ["C_Object", XSD::QName.new(nil, "start")], [0, 1]],
      ["v_end", ["C_Object", XSD::QName.new(nil, "end")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => ObjectList,
    :schema_type => XSD::QName.new(NsSoap, "ObjectList"),
    :schema_element => [
      ["item", ["C_Object[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => Field,
    :schema_type => XSD::QName.new(NsSoap, "Field"),
    :schema_element => [
      ["id", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "id")]],
      ["data", ["C_Data", XSD::QName.new(nil, "data")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => Record,
    :schema_type => XSD::QName.new(NsSoap, "Record"),
    :schema_element => [
      ["item", ["Field[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => IDSPScriptArg,
    :schema_type => XSD::QName.new(NsSoap, "IDSP-ScriptArg"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPString", XSD::QName.new(nil, "value")]]
    ]
  )

  LiteralRegistry.register(
    :class => RunScriptParameters,
    :schema_type => XSD::QName.new(NsSoap, "RunScriptParameters"),
    :schema_element => [
      ["scriptText", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptText")], [0, 1]],
      ["scriptLanguage", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptLanguage")], [0, 1]],
      ["scriptFile", ["SOAP::SOAPString", XSD::QName.new(nil, "scriptFile")], [0, 1]],
      ["scriptArgs", ["IDSPScriptArg[]", XSD::QName.new(nil, "scriptArgs")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => C_Data,
    :schema_type => XSD::QName.new(NsSoap, "Data"),
    :schema_element => [
      ["data", [nil, XSD::QName.new(nil, "data")]]
    ]
  )

  LiteralRegistry.register(
    :class => List,
    :schema_type => XSD::QName.new(NsSoap, "List"),
    :schema_element => [
      ["item", ["C_Data[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => C_Object,
    :schema_type => XSD::QName.new(NsSoap, "Object"),
    :schema_element => [
      ["specifierData", [nil, XSD::QName.new(nil, "specifierData")]],
      ["objectType", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "objectType")]],
      ["specifierForm", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "specifierForm")]],
      ["start", ["C_Object", XSD::QName.new(nil, "start")], [0, 1]],
      ["v_end", ["C_Object", XSD::QName.new(nil, "end")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ObjectList,
    :schema_type => XSD::QName.new(NsSoap, "ObjectList"),
    :schema_element => [
      ["item", ["C_Object[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => Field,
    :schema_type => XSD::QName.new(NsSoap, "Field"),
    :schema_element => [
      ["id", ["SOAP::SOAPUnsignedLong", XSD::QName.new(nil, "id")]],
      ["data", ["C_Data", XSD::QName.new(nil, "data")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Record,
    :schema_type => XSD::QName.new(NsSoap, "Record"),
    :schema_element => [
      ["item", ["Field[]", XSD::QName.new(nil, "item")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => RunScript,
    :schema_name => XSD::QName.new(NsSoap, "RunScript"),
    :schema_element => [
      ["runScriptParameters", ["RunScriptParameters", XSD::QName.new(nil, "runScriptParameters")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => RunScriptResponse,
    :schema_name => XSD::QName.new(NsSoap, "RunScriptResponse"),
    :schema_element => [
      ["errorNumber", ["SOAP::SOAPInt", XSD::QName.new(nil, "errorNumber")]],
      ["errorString", ["SOAP::SOAPString", XSD::QName.new(nil, "errorString")], [0, 1]],
      ["scriptResult", ["C_Data", XSD::QName.new(nil, "scriptResult")], [0, 1]]
    ]
  )
end
