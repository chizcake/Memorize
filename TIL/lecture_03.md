# Lecture 3 TIL

* model 에 변화가 발생해서 이를 구독 중인 객체들에게 알리고 싶을 때 `@Published` 라는 property wrapper 를 사용한다. 
* `@Published` properties 를 가진 클래스는 `ObservableObject` protocol 을 구현해야 한다. (`ObservableObject` 는 `AnyObject` 를 구현하고 있기 때문에 클래스만 `ObservableObject` 를 구현할 수 있다.) 
* `ObservableObject` 를 저장하는 property 앞에 `@ObservedObject` property wrapper 를 사용하면, `ObservableObject` 가 가지고 있는 `@Published` property 에 변화가 생겼을 때 `@ObservedObject` 를 가진 객체에게 알려줄 수 있다.

```swift
// EmojiMemoryGameView.swift
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in 
                // `@ObservedObject` 가 publishing 하였을 때 SwiftUI 는 view 를 다시 그린다.
                // 하지만 모든 view 를 다시 그리지는 않고, 변화가 일어난 view 만 다시 그린다.
                //
                // 가령 CardView 를 다시 그리도록 했을 때, SwiftUI 는 CardView 가 가지고 있는 card 객체가 바뀌었는지 확인한다.
                // 만약 새로 주어진 card 객체와 기존의 card 객체가 동일한 객체라고 판단한다면, SwiftUI 는 CardView 를 다시 그리지 않는다.
                CardView(card: card).onTapGesture {
                    viewModel.choose(card)
                }
            }
        }
    }
}

// EmojiMemoryGameViewModel.swift
final class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame<String>

    ...

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

// MemoryGame.swift
struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>

    ...

    func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(of: card) else { return }
        cards[chosenIndex].isFaceUp.toggle()
    }
}

extension MemoryGame {
    struct Card: Identifiable, Equatable {
        let id: Int
        let content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false

        /*
         * Equatable 재정의할 때 주의하도록 하자!
         *
         * Card 값이 변화하면 MemoryGame 이 바뀐 것으로 인식하기 때문에 SwiftUI 는 view 를 다시 그리도록 지시한다.
         * CardView 를 다시 그릴 때는 기존의 CardView 가 가진 Card 객체와 새롭게 받은 Card 객체가 일치하는지 확인한다. 
         * 이 때 Equatable 을 통해 정의한 `==` 함수를 사용하게 된다. 
         * 예제에서 카드를 선택하면 Card.isFaceUp 값이 변화하게 되는데, 만약 우리가 Equatable 을 통해 id 값의 일치 여부만 판단한다면 
         * SwiftUI 는 `isFaceUp` 값이 바뀌었음에도 `==` 함수에 의해 두 Card 객체는 동일하다고 판단하고 CardView 를 다시 그리지 않는다.

        static func == (lhs: Card, rhs: Card) -> Bool {
            lhs.id == rhs.id
        }
        */
    }
}
```