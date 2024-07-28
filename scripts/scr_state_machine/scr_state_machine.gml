// Script assets have changed for v2.3.0 see
function StateMachine() constructor {
    static null_state = new State();

    state = null_state;
    time = 0;

    // Swap to a new state
    swap = function(_state = null_state) {
        state.destroy();

        state = _state;
        time = 0;

        state.create();
    }

    // Run current state
    run = function() {
        state.update();
        time++;
    }
}