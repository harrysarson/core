module Platform.Bag exposing
    ( EffectBag
    , EffectManagerName
    , EffectThunk
    , EffectThunkMapper
    , createEffectThunk
    , mapEffectThunk
    , LeafType
    , GenericMsg
    )


type alias EffectBag msg =
    List {
        thunk: EffectThunk msg,
        mapper: EffectThunkMapper msg GenericMsg
    }


type LeafType msg
    = LeafType Kernel


type EffectManagerName
    = EffectManagerName Kernel


type EffectThunk msg
    = EffectThunk Kernel


type alias EffectThunkMapper a b
    = (a -> b) -> EffectThunk a -> EffectThunk b


type GenericMsg
    = GenericMsg Kernel


type HiddenRouter
    = HiddenRouter Kernel


type Kernel
    = Kernel Kernel


createEffectThunk :
    EffectThunk msg
    -> EffectThunkMapper a b
    ->
        { thunk : EffectThunk msg
        , mapper : EffectThunkMapper msg GenericMsg
        }
createEffectThunk thunk mapper =
    { thunk = Elm.Kernel.Basics.fudgeType thunk
    , mapper = Elm.Kernel.Basics.fudgeType mapper
    }


mapEffectThunk :
    (oldMsg -> newMsg)
    ->
        { thunk : EffectThunk oldMsg
        , mapper : EffectThunkMapper oldMsg GenericMsg
        }
    ->
        { thunk : EffectThunk newMsg
        , mapper : EffectThunkMapper newMsg GenericMsg
        }
mapEffectThunk fn { thunk, mapper } =
    let
        trueMapper : EffectThunkMapper oldMsg newMsg
        trueMapper =
            Elm.Kernel.Basics.fudgeType mapper
    in
    createEffectThunk (trueMapper fn thunk) trueMapper
