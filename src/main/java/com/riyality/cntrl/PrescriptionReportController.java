package com.riyality.cntrl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.riyality.Dto.prescriptions.MedicineResponseDto;
import com.riyality.Dto.prescriptions.PrescriptionResponseDto;
import com.riyality.service.HrService;
import com.riyality.service.PatientService;
import com.riyality .service.PrescriptionServiceImpl;
import com.riyality.Dto.doctors.DoctorResponseDto;
import com.riyality.Dto.patients.PatientResponseDto;

@RestController
public class PrescriptionReportController {

	@Autowired
	private PatientService patientService;
	@Autowired
	private HrService hrService;

	@Autowired
	private PrescriptionServiceImpl prescriptionServiceImpl;

	@GetMapping( "/generate-pdf/{id}" )
	public void generatePdf( HttpServletResponse response, @PathVariable long id, HttpSession session ) throws DocumentException, IOException {
		// Set the content type and header for the response

		//getPatientById
		PatientResponseDto patient = patientService.getPatientById( id );

		Long doctorId = ( Long ) session.getAttribute( "loginId" );

		DoctorResponseDto doctor = hrService.getDoctorById( doctorId );

		List<PrescriptionResponseDto> prescriptionRequestDto = prescriptionServiceImpl.findTopById( patient.getId() );

		List<MedicineResponseDto> medicineResponseDto = prescriptionServiceImpl.findMedicineByPrescriptionId( prescriptionRequestDto.get( 0 ).getPrescriptionId() );

		response.setContentType( "application/pdf" );
		response.setHeader( "Content-Disposition", "inline; filename=example.pdf" );
		Font bf28 = new Font( FontFamily.COURIER, 18, Font.NORMAL, BaseColor.DARK_GRAY );
		Font bf30 = new Font( FontFamily.UNDEFINED, 30 );
		Font bf32 = new Font( FontFamily.COURIER, 28, Font.BOLD, BaseColor.DARK_GRAY );
		Font MedicienFont = new Font( FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.DARK_GRAY );
		Font MedicienTableFont = new Font( FontFamily.HELVETICA, 13, Font.BOLD, BaseColor.WHITE );
		Font MedicienTableDataFont = new Font( FontFamily.HELVETICA, 12, Font.ITALIC, BaseColor.DARK_GRAY );
		Font EndBorderFont = new Font( FontFamily.HELVETICA, 1, Font.ITALIC, BaseColor.DARK_GRAY );
		Font bf16 = new Font( FontFamily.COURIER, 15, Font.NORMAL, BaseColor.BLACK );
		Font bf14 = new Font( FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.GRAY );
		float leftMargin5f = 5f;
		float leftMargin10f = 10f;
		float leftMargin15f = 15f;
		float leftMargin20f = 20f;
		float leftMargin25f = 25f;
		float leftMargin50f = 50f;
		float leftMargin70f = 70f;
		float leftMargin90f = 90f;
		float leftMargin140f = 140f;
		float leftMargin550f = 500f;
		float opacity = 0.5f;
		Document document = new Document();
		PdfWriter.getInstance( document, response.getOutputStream() );
		document.open();
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern( "yyyy-MM-dd HH:mm:ss" );
		String formattedDateTime = currentDateTime.format( formatter );
		Paragraph indentedParagraph1 = new Paragraph( "Anjali Hospital", bf28 );
		indentedParagraph1.setIndentationLeft( 190 );
		document.add( indentedParagraph1 );

		Paragraph para2 = new Paragraph( "Suryavanshi complex, Chalisgaon Road, Bhadgaon,Tongaon, Maharashtra 424105",
				bf14 );
		para2.setIndentationLeft( 50 );
		document.add( para2 );

		Paragraph paraphone = new Paragraph( " Phone : 02596 297 777 ", bf14 );
		paraphone.setIndentationLeft( 180 );
		document.add( paraphone );
		Paragraph para1 = new Paragraph( "Patient : " + patient.getFirstName() + " " + patient.getLastName() + "", bf16 );
		document.add( para1 );

		PdfPTable table3 = new PdfPTable( 4 );
		table3.setSpacingBefore( 25f );
		table3.setWidthPercentage( 100 );
		table3.setWidths( new float[] { 1.0f, 1.5f, 1.0f, 1.5f } );

		table3.addCell( createCell( "Doctor  :", 0 ) );
		table3.addCell( createCell( "" + doctor.getFirstName() + "  " + doctor.getLastName() + "", 0 ) );
		table3.addCell( createCell( "     Date  :", 0 ) );
		table3.addCell( createCell( "" + formattedDateTime + "", 0 ) );

		document.add( table3 );

		// add Line
		Paragraph lineParagraph2 = new Paragraph();

		LineSeparator line2 = new LineSeparator();
		line2.setLineWidth( 1 );
		line2.setLineColor( BaseColor.GRAY );
		lineParagraph2.add( line2 );
		document.add( lineParagraph2 );

		//MedicineDetailsTable
		PdfPTable Medicine = new PdfPTable( 6 );

		Medicine.setWidthPercentage( 100 );
		Medicine.setSpacingBefore( 20f );
		Medicine.setWidths( new float[] { 2.5f, 2.5f, 1.5f, 3.5f, 1.5f, 1.5f } );

		PdfPCell c1 = new PdfPCell( new Phrase( "Medicine Type", MedicienTableFont ) );
		c1.setBorderWidth( 0 );
		c1.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c1 );

		PdfPCell c2 = new PdfPCell( new Phrase( "Medicine Name", MedicienTableFont ) );
		c2.setBorderWidth( 0 );
		c2.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c2 );

		PdfPCell c3 = new PdfPCell( new Phrase( "Dosage", MedicienTableFont ) );
		c3.setBorderWidth( 0 );
		c3.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c3 );

		PdfPCell c4 = new PdfPCell( new Phrase( "Instructions", MedicienTableFont ) );
		c4.setBorderWidth( 0 );
		c4.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c4 );

		PdfPCell c5 = new PdfPCell( new Phrase( "Days", MedicienTableFont ) );
		c5.setBorderWidth( 0 );
		c5.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c5 );

		PdfPCell c6 = new PdfPCell( new Phrase( "Quantity", MedicienTableFont ) );
		c6.setBorderWidth( 0 );
		c6.setBackgroundColor( BaseColor.GRAY );
		Medicine.addCell( c6 );

		for ( MedicineResponseDto medicineresponseDto : medicineResponseDto ) {

			PdfPCell c13 = new PdfPCell( new Phrase( " " ) );
			c13.setBorderWidth( 0 );
			Medicine.addCell( c13 );

			PdfPCell c14 = new PdfPCell( new Phrase( " " ) );
			c14.setBorderWidth( 0 );
			Medicine.addCell( c14 );

			PdfPCell c15 = new PdfPCell( new Phrase( " " ) );
			c15.setBorderWidth( 0 );
			Medicine.addCell( c15 );

			PdfPCell c16 = new PdfPCell( new Phrase( " " ) );
			c16.setBorderWidth( 0 );
			Medicine.addCell( c16 );

			PdfPCell c17 = new PdfPCell( new Phrase( " " ) );
			c17.setBorderWidth( 0 );
			Medicine.addCell( c17 );

			PdfPCell c18 = new PdfPCell( new Phrase( " " ) );
			c18.setBorderWidth( 0 );
			Medicine.addCell( c18 );

			PdfPCell c7 = new PdfPCell( new Phrase( "" + medicineresponseDto.getMedicineType() + "", MedicienTableDataFont ) );
			c7.setBorderWidth( 0 );
			Medicine.addCell( c7 );

			PdfPCell c8 = new PdfPCell( new Phrase( "" + medicineresponseDto.getMedicineName() + "", MedicienTableDataFont ) );
			c8.setBorderWidth( 0 );
			Medicine.addCell( c8 );

			PdfPCell c9 = new PdfPCell( new Phrase( "" + medicineresponseDto.getDosage() + "", MedicienTableDataFont ) );
			c9.setBorderWidth( 0 );
			Medicine.addCell( c9 );

			PdfPCell c10 = new PdfPCell( new Phrase( "" + medicineresponseDto.getInstructions() + "", MedicienTableDataFont ) );
			c10.setBorderWidth( 0 );
			Medicine.addCell( c10 );

			PdfPCell c11 = new PdfPCell( new Phrase( "" + medicineresponseDto.getNumDays() + "", MedicienTableDataFont ) );
			c11.setBorderWidth( 0 );
			Medicine.addCell( c11 );

			PdfPCell c12 = new PdfPCell( new Phrase( "" + medicineresponseDto.getTabletQuantity(), MedicienTableDataFont ) );
			c12.setBorderWidth( 0 );
			Medicine.addCell( c12 );

		}
		document.add( Medicine );

		Rectangle rect = new Rectangle( 557, 805, 28, 35 ); // you can resize rectangle
		rect.enableBorderSide( 1 );
		rect.setBorderColor( BaseColor.BLACK );
		rect.setBorderWidth( 3 );
		document.add( rect );

		Rectangle rect1 = new Rectangle( 577, 825, 18, 15 ); // you can resize rectangle
		rect1.enableBorderSide( 1 );
		rect1.enableBorderSide( 2 );
		rect1.enableBorderSide( 4 );
		rect1.enableBorderSide( 8 );
		rect1.setBorderColor( BaseColor.BLACK );
		rect1.setBorderWidth( 1 );
		document.add( rect1 );

		document.close();
	}

	private static PdfPCell createCell( String text, float borderWidth ) {
		PdfPCell cell = new PdfPCell();
		cell.setBorderWidth( borderWidth );
		cell.addElement( new com.itextpdf.text.Paragraph( text ) );
		return cell;
	}
}