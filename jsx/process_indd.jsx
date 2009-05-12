/*
    Este arquivo processa o INDD inicial gerando todos os thumbnails e o XML
    arg0 - caminho para o arquivo INDD
    arg1 - caminho para salvar os JPGs
    arg2 - caminho para salvar o XML
*/
function main()
{
    // Abre o dito cujo
    currentDocument = app.open(File(arg0));

    // Gera os thumbs
    app.jpegExportPreferences.jpegExportRange = ExportRangeOrAllPages.EXPORT_ALL;
    app.jpegExportPreferences.jpegQuality = JPEGOptionsQuality.medium;// * 0.6;
    app.jpegExportPreferences.resolution = 72;
    currentDocument.exportFile(ExportFormat.jpg, File(arg1), app.pdfExportPresets.item("[High Quality Print]"));

    // Exporta o XML!
    currentDocument.exportFile(ExportFormat.xml, File(arg2));

    // Fecha!
    currentDocument.close()
	return "1"
}
main();
