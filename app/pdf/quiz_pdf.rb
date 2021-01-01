class QuizPdf < Prawn::Document
  
    def initialize(quiz)
      super(top_margin: 40, bottom_margin: 40)
      @quiz = quiz
      m_heading
      data_display
      end_doc
    end
  
    def m_heading
      text "MIRROR ASSIGNMENTS", size: 30, :color => "0000ff"

 
      stroke_horizontal_rule
    end

    def data_display
         
      move_down 20
         text "DETAILS",style: :bold
          move_down 20
          text "NAME:   _________________________________________"
          move_down 5
          text "DATE:   __________________________________________"
      move_down 40
        table [["ASSIGNMENT NAME......................................................................................",@quiz.name], ["PASSING PERCENTAGE", @quiz.result], ["SCHEDULED DATE", @quiz.schedule]]
      move_down 20
       stroke_horizontal_rule
      move_down 20
         text "INSTRUCTIONS",style: :bold
      move_down 50
         text "The answer sheet should be filled only with a black ballpoint pen."
      move_down 10
         text "Before starting to answer, you should fill in the details like centre, subject, subject code, roll number, and test booklet series (which will be printed on the test booklet/question paper booklet) with a black ballpoint pen.", align: :justify
        move_down 10
          text "You should also encode the test booklet series, subject code and your roll number in the space provided as shown below. Please note that everything should be written and marked in the answer sheet only using a black ballpoint pen.", align: :justify
        move_down 10
        text "Articles permitted inside the exam hall:-", style: :bold
        move_down 10
        text "A. Clipboard or hardboard on which nothing is marked or written."
        move_down 5
        text "B. Black ballpoint pen for marking in the OMR."
        move_down 5
        text "C. Answer sheet and a rough sheet will be provided by the invigilator in the exam hall."
        move_down 10
        text "Articles not permitted inside the exam hall:-", style: :bold
        move_down 5
        text "A. Books, notes, loose sheets, mathematical or drawing instruments, electronic or other kinds of calculators, log tables, slide rules, maps stencils, test booklets or rough sheets of other sessions of exam.", align: :justify
        move_down 5
        text "B. Mobile phones, BlueTooth, pagers or any communication device are not allowed."
        move_down 5
        text "C. Candidates are advised not to bring any of the banned items otherwise disciplinary action can be taken against them.", align: :justify
        move_down 5
        text "D. Candidates are also advised not to bring any of the banned items into the venue as their safekeeping cannot be guaranteed.", align: :justify
        move_down 10
        text "Penalty for incorrect answers:-", style: :bold
        move_down 10
        text "A. There will be negative marking for incorrect answers."
        move_down 5
        text "B. For every wrong answer, 1/3rd of marks assigned to that question will be deducted."
        move_down 5
        text "C. If a candidate marks more than one answer, it will be treated as a wrong answer even if one of the marked options happens to be the right answer.", align: :justify
        move_down 5
        text "D. If a question is left without any marking, there will not be any negative mark."
        move_down 10
        text "Prohibition of unfair means:-", style: :bold
        move_down 10
        text "A. Candidates should not copy answers from other candidates’ answer sheet. They should also not permit their own answers to be copied by others.", align: :justify
        move_down 5
        text "B. Conduct inside the exam hall"
        move_down 5
        text "Any misconduct by the candidates inside the exam hall will invite severe penalty against them. Misconduct means:", style: :bold
        move_down 10
        text "A. Misbehaving in any manner."
        move_down 10
        text "B. Creating a disorderly scene in the hall."
        move_down 10
        text "C. Harassing the staff employed by the UPSC for the conduct of the exam."
        move_down 20
        stroke_horizontal_rule
         move_down 20
        text "QUESTIONS",style: :bold
         move_down 20
        stroke_horizontal_rule
         move_down 30


        

        @quiz.questions.each do |q|
      
        text q.ques, style: :bold
        move_down 10
        table [["A.", q.optionone],["B.", q.optiontwo],["C.", q.optionthree],["D.", q.optionfour]]
        move_down 10
        text "- - - - - - - - - -" 
       end
       move_down 30
      
        stroke_horizontal_rule
         move_down 20
        text "ANSWER KEY",style: :bold
         move_down 20
        stroke_horizontal_rule
         move_down 20
         @quiz.keys.each do |jj|
        
         text jj.answer
          move_down 5

        end
       move_down 30
       stroke_horizontal_rule
       move_down 20
       text "SCORE:   _________________________________________"
    end


    def end_doc
       move_down 50
      text "***************************************", size: 10, align: :center

    end
  
end