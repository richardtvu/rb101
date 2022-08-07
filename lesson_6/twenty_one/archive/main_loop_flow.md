# Mermaid Flowchart for 21 Logic.
https://mermaid-js.github.io/mermaid/#/flowchart


```mermaid
graph TD
    A[START] --> |WELCOME!| B(INITIALIZE VARIABLES)
    B --> C(DEAL CARDS) -->  |SHOW CARDS| E(PLAYER_TURN)
    E --> F(BUSTED?)
    F --> |YES| G(fa:fa-car PLAY AGAIN?)
    F --> |NO| H(SHOW CARDS)
    H --> |ANNOUNCE| I(DEALER'S TURN)
    I --> J(BUSTED?)
    J --> |YES|G
    J --> |NO|K(SHOW DEALER CARDS)
    K --> L(CALCULATE RESULT) --> |DISPLAY WINNER| G --> |YES| A[START]
    G --> |NO|M(GOOD BYE!)

  ```