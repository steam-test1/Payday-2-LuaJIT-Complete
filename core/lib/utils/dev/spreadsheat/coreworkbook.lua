core:module("CoreWorkbook")
core:import("CoreClass")

local EMPTY_WORKBOOK_XML1 = "<?xml version=\"1.0\"?>\n<?mso-application progid=\"Excel.Sheet\"?>\n<Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\"\n xmlns:o=\"urn:schemas-microsoft-com:office:office\"\n xmlns:x=\"urn:schemas-microsoft-com:office:excel\"\n xmlns:ss=\"urn:schemas-microsoft-com:office:spreadsheet\"\n xmlns:html=\"http://www.w3.org/TR/REC-html40\">\n <Styles>\n  <Style ss:ID=\"Default\" ss:Name=\"Normal\">\n   <Alignment ss:Vertical=\"Bottom\"/>\n  </Style>\n  <Style ss:ID=\"header1\">\n   <Font x:Family=\"Swiss\" ss:Bold=\"1\"/>\n  </Style>\n  <Style ss:ID=\"header2\">\n   <Font x:Family=\"Swiss\" ss:Bold=\"1\" ss:Italic=\"1\"/>\n  </Style>\n </Styles>"
local EMPTY_WORKBOOK_XML2 = "</Workbook> "

Workbook = Workbook or CoreClass.class()

function Workbook:init()
	self._worksheets = {}
end

function Workbook:add_worksheet(worksheet)
	table.insert(self._worksheets, worksheet)
end

function Workbook:to_xml(f)
	f:write(EMPTY_WORKBOOK_XML1)

	local ws_xml = ""

	for _, ws in ipairs(self._worksheets) do
		f:write("\n")
		ws:to_xml(f)
	end

	f:write(EMPTY_WORKBOOK_XML2)
end
