import pdfkit

input_html = 'pdf_resume.html'
output_pdf = 'resume.pdf'

try:
    # Convert HTML to PDF
    pdfkit.from_file(input_html, output_pdf)
    print(f'Successfully converted {input_html} to {output_pdf}')
except Exception as e:
    print(f'Error: {str(e)}')