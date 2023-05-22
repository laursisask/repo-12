package slack

import (
	"context"
	"math/rand"
	"time"
)

type Backoff struct {
	Attempt int
	Base    time.Duration
	Cap     time.Duration
}

func (b *Backoff) Sleep(ctx context.Context) {
	b.Attempt++

	//nolint:gomnd
	wait := b.Base * (2 << b.Attempt)
	if wait > b.Cap {
		wait = b.Cap
	}

	wait = time.Duration(rand.Int63n(int64(wait)))

	select {
	case <-time.After(wait):
	case <-ctx.Done():
	}
}
