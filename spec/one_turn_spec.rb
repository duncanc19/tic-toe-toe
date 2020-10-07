require_relative '../one_turn'


context OneTurn do
    describe "#play_turn" do
        it "receives on valid move and shows it on the board" do
            # Arrange 
            present = Present.new
            turn = OneTurn.new
            allow(present.input).to receive(:gets) {"0,2"}
            turn.play_turn(present)
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act and Assert (in {})
            expect { present.output_to_command_line }
            .to output(expected_string)
            .to_stdout_from_any_process
        end

        it "receives an invalid(wrong format) move, then a valid move so shows valid move on the board" do
            # Arrange 
            present = Present.new
            turn = OneTurn.new
            allow(present.input).to receive(:gets).and_return("blah", "0,2")
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act 
            turn.play_turn(present)
            # Assert (in {})
            expect { present.output_to_command_line }
            .to output(expected_string)
            .to_stdout_from_any_process
        end

        it "receives an invalid(game rules) move, then a valid move so shows valid move on the board" do
            # Arrange 
            present = Present.new
            turn = OneTurn.new
            allow(present.input).to receive(:gets).and_return("0,8", "0,2")
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act 
            turn.play_turn(present)
            # Assert (in {})
            expect { present.output_to_command_line }
            .to output(expected_string)
            .to_stdout_from_any_process
        end
        it "receives both types of invalid move, then a valid move so shows valid move on the board" do
            # Arrange 
            present = Present.new
            turn = OneTurn.new
            allow(present.input).to receive(:gets).and_return("blah","0,8", "0,2")
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act 
            turn.play_turn(present)
            # Assert (in {})
            expect { present.output_to_command_line }
            .to output(expected_string)
            .to_stdout_from_any_process
        end


    end
end