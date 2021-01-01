class ItenaryPdf < Prawn::Document
  
    def initialize(itenary)
      super(top_margin: 40, bottom_margin: 40)
      @itenary = itenary
      m_heading
      data_display
      end_doc
    end
  
    def m_heading
      text "MIRROR ITENARY", size: 30, :color => "0000ff"
  

 
      stroke_horizontal_rule
    end

    def data_display

      move_down 20

      result = 0 
      q = @itenary.related.to_i
      v =  Estimate.find(q) 
             v.tours.each do |yy| 
                g = yy.multiplier
                f = yy.namec
                r = (f*g) 
                result = result + r
             end
    
      text "DETAILS",style: :bold
       
      move_down 20
        table [["NAME OF ITENARY",@itenary.planname],["TOTAL TRIP BUDGET (INR)", result ],["SCHEDULED START DATE",@itenary.start.to_s(:rfc822)]]
      move_down 20
      stroke_horizontal_rule
      move_down 20
      text "PLANNED ACTIVITIES",style: :bold
      
      move_down 20
      table line_item_rows do 
        row(0).font_style = :bold
        columns(1..5).align = :left
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        columns(1..5).width = 115
      end

  
    end
    


    def line_item_rows
      [["Date", "Activity Name", "Mode of Travel", "Distance (Kms.)", "Stay (Days)"]] +
      @itenary.subitenaries.map do |item|
        [item.begin.to_s(:rfc822),item.activity, item.modeoftravel, item.distance, item.stay]
      end
    end


    def end_doc
       move_down 50
      text "***************************************", size: 10, align: :center

    end
  
end