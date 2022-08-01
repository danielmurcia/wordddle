# wordddle
Open source Wordddle game

## Missing parts
- Data layer:
    - Stats repo
        - Save/Load: Streak, Won (per #tries) / Lost
    
- Domain layer
    - Stats usecases
        - Save on game over
        - Load: Streak, Won (per #tries) / Lost
    - Inject UseCases so current game is not deleted when coming back to home screen
    
- Presentation layer
    - Beautify UI :/
    - Game over dialog (Won / Lost)
        - Use stats widget
    - Instructions screen/dialog
