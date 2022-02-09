package main

import "testing"

func Test_helloMessage(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "t1",
			want: "Hello, world!",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := helloMessage(); got != tt.want {
				t.Errorf("helloMessage() = %v, want %v", got, tt.want)
			}
		})
	}
}
