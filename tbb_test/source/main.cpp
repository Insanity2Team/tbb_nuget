#include <iostream>
#include <tbb/parallel_for.h>

using namespace tbb;

void Foo(float v) {
	std::cout << v << std::endl;
}

class ApplyFoo {
	float *const my_a;
public:
	void operator()(const blocked_range<size_t>& r) const {
		float *a = my_a;
		for (size_t i = r.begin(); i != r.end(); ++i)
			Foo(a[i]);
	}
	ApplyFoo(float a[]) :
		my_a(a)
	{}
};

void ParallelApplyFoo(float a[], size_t n) {
	parallel_for(blocked_range<size_t>(0, n), ApplyFoo(a));
}

int main()
{
	float v[] = { 1.0f,2.0f,3.0f,4.0f };
	ParallelApplyFoo(v, 4);

	return 0;
}
