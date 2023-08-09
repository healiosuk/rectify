RSpec.describe Rectify::Command do
  describe ".call" do
    let(:instance) { spy }

    context "with no arguments" do
      it "instantiates and invokes #call" do
        allow(NoArgsCommand).to receive(:new).with(no_args) { instance }
        allow(instance).to receive(:call)

        NoArgsCommand.call

        expect(NoArgsCommand).to have_received(:new).with(no_args) { instance }
        expect(instance).to have_received(:call)
      end

      it "returns broadcast events with their result (single)" do
        events = ReturnSingleResultCommand.call

        expect(events).to eq(ok: "This is a result")
      end

      it "returns broadcast events with their result (multiple)" do
        events = ReturnMultiResultCommand.call

        expect(events).to eq(ok: [1, 2, 3])
      end

      it "returns broadcast all events with their result" do
        events = ReturnMultiEventMultiResultCommand.call

        expect(events).to eq(
          ok: [1, 2, 3],
          published: "The command works",
          next: []
        )
      end
    end

    context "with arguments" do
      it "instantiates with the same arguments and invokes #call" do
        allow(ArgsCommand).to receive(:new).with(:a, :b, :c) { instance }
        allow(instance).to receive(:call)

        ArgsCommand.call(:a, :b, :c)

        expect(ArgsCommand).to have_received(:new).with(:a, :b, :c) { instance }
        expect(instance).to have_received(:call)
      end
    end
  end

  # rubocop:disable RSpec/InstanceVariable
  describe "#on" do
    def success
      @success = true
    end

    def failure
      @failure = true
    end

    def something_private
      @private = true
    end

    private :something_private

    it "calls public methods on the caller" do
      @success = false
      @failure = false

      SuccessCommand.call do
        on(:success) { success }
        on(:failure) { failure }
      end

      expect(@success).to be(true)
      expect(@failure).to be(false)
    end

    it "calls private methods on the caller" do
      @private = false

      SuccessCommand.call do
        on(:success) { something_private }
      end

      expect(@private).to be(true)
    end
  end
  # rubocop:enable RSpec/InstanceVariable
end
