class JournalPdf < Prawn::Document
  
    def initialize(research)
      super(top_margin: 40, bottom_margin: 40)
      @research = research
      m_heading
      data_display
      end_doc
    end
  
    def m_heading
      text "MIRROR JOURNAL", size: 30, :color => "0000ff"

 
      stroke_horizontal_rule
    end

    def data_display
       
         @research.each do |r|
          move_down 30
          text r.mainheading, size: 15, style: :bold, :color => "08088A"
          move_down 10
          text r.subheading, size: 10, style: :bold
          move_down 20
          text r.body, size: 10, align: :justify
      
       end
    end


    def end_doc
       move_down 50
      text "***************************************", size: 10, align: :center

    end
  
end